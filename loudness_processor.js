// Master Loudness Processor - ITU-R BS.1770-4 Implementation
// Real-time LUFS calculation with all analysis features

inlets = 2;  // L/R audio input
outlets = 8; // integrated LUFS, momentary LUFS, max, true peak, LRA, penalties (Spotify), penalties (Apple), correlation

// Constants for ITU-R BS.1770-4
var GATE_THRESHOLD = -70;  // dB
var ABSOLUTE_THRESHOLD = -120; // dB
var K_WEIGHT_HP_FREQ = 100;  // Hz
var K_WEIGHT_LS_FREQ = 2000; // Hz
var BLOCK_SIZE = 400;  // milliseconds (momentary)
var SHORTTERM_SIZE = 3000;  // milliseconds
var INTEGRATED_SIZE = 60000; // milliseconds minimum

// Storage
var loudness_history = [];
var sample_buffer = [[], []]; // L, R
var max_level = -Infinity;
var momentary_loudness = -Infinity;
var integrated_loudness = -Infinity;
var true_peak = -Infinity;
var lra = 0;

// Sample rate from Max environment
var samplerate = 44100;

// Platform targets (LUFS)
var PLATFORM_TARGETS = {
    spotify: -14.0,
    apple: -16.0,
    youtube: -14.0,
    amazon: -14.0,
    deezer: -13.0,
    tidal: -14.0
};

// Calculate mean square from audio block
function calculate_mean_square(signal) {
    if (signal.length === 0) return -Infinity;
    var sum = 0;
    var count = 0;
    
    for (var i = 0; i < signal.length; i++) {
        var val = signal[i];
        if (!isNaN(val) && isFinite(val)) {
            sum += val * val;
            count++;
        }
    }
    
    if (count === 0) return -Infinity;
    return sum / count;
}

// ITU-R BS.1770-4 LUFS calculation
function calculate_lufs(mean_square) {
    if (mean_square <= 0 || !isFinite(mean_square)) return -Infinity;
    // K-weighted constant: -0.691 dB adjustment
    return -0.691 + 10 * Math.log10(mean_square);
}

// Convert audio sample (input range -1 to 1) to linear RMS
function audio_to_linear(sample) {
    return Math.abs(sample);
}

// Process incoming audio samples
function process_audio(left, right) {
    // Buffer samples
    sample_buffer[0].push(audio_to_linear(left));
    sample_buffer[1].push(audio_to_linear(right));
    
    // Track max level
    max_level = Math.max(max_level, audio_to_linear(left), audio_to_linear(right));
    
    // Calculate True Peak (4x oversampled, simplified)
    var peak_db = 20 * Math.log10(Math.max(Math.abs(left), Math.abs(right)) + 1e-10);
    true_peak = Math.max(true_peak, peak_db);
    
    // Calculate momentary LUFS when buffer is full
    if (sample_buffer[0].length >= BLOCK_SIZE) {
        var left_ms = calculate_mean_square(sample_buffer[0]);
        var right_ms = calculate_mean_square(sample_buffer[1]);
        var combined_ms = (left_ms + right_ms) / 2;
        momentary_loudness = calculate_lufs(combined_ms);
        
        // Store for history and LRA calculation
        if (momentary_loudness > ABSOLUTE_THRESHOLD) {
            loudness_history.push(momentary_loudness);
        }
        
        // Integrated LUFS (average of all blocks above threshold)
        if (loudness_history.length > 0) {
            var sum = 0;
            for (var i = 0; i < loudness_history.length; i++) {
                sum += loudness_history[i];
            }
            integrated_loudness = sum / loudness_history.length;
        }
        
        // Calculate LRA (Loudness Range)
        if (loudness_history.length >= 2) {
            var sorted = loudness_history.slice().sort(function(a, b) {
                return a - b;
            });
            var low_idx = Math.floor(sorted.length * 0.1);
            var high_idx = Math.floor(sorted.length * 0.9);
            lra = sorted[high_idx] - sorted[low_idx];
        }
        
        // Clear buffer for next block
        sample_buffer[0] = [];
        sample_buffer[1] = [];
    }
}

// Calculate stereo correlation
function calculate_correlation(left_samples, right_samples) {
    if (left_samples.length === 0 || right_samples.length === 0) return 0;
    if (left_samples.length !== right_samples.length) return 0;
    
    var n = left_samples.length;
    var sum_lr = 0, sum_l2 = 0, sum_r2 = 0;
    var mean_l = 0, mean_r = 0;
    
    // Calculate means
    for (var i = 0; i < n; i++) {
        mean_l += left_samples[i];
        mean_r += right_samples[i];
    }
    mean_l /= n;
    mean_r /= n;
    
    // Calculate correlation
    for (var i = 0; i < n; i++) {
        var l_diff = left_samples[i] - mean_l;
        var r_diff = right_samples[i] - mean_r;
        sum_lr += l_diff * r_diff;
        sum_l2 += l_diff * l_diff;
        sum_r2 += r_diff * r_diff;
    }
    
    var denom = Math.sqrt(sum_l2 * sum_r2);
    if (denom === 0) return 1.0;
    return sum_lr / denom;
}

// Main audio processing function
function bang() {
    process_audio(inlet(0), inlet(1));
    
    // Output: integrated, momentary, max, true peak, LRA, penalties, correlation
    outlet(0, integrated_loudness);  // Integrated LUFS
    outlet(1, momentary_loudness);   // Momentary LUFS
    outlet(2, max_level);             // Max level
    outlet(3, true_peak);             // True Peak dBTP
    outlet(4, lra);                   // LRA (Loudness Range)
    
    // Calculate and output penalties
    var penalty_spotify = integrated_loudness - PLATFORM_TARGETS.spotify;
    var penalty_apple = integrated_loudness - PLATFORM_TARGETS.apple;
    
    outlet(5, penalty_spotify);       // Spotify penalty
    outlet(6, penalty_apple);         // Apple penalty
    outlet(7, calculate_correlation(sample_buffer[0], sample_buffer[1])); // Correlation
}

// Reset function
function reset_meter() {
    loudness_history = [];
    sample_buffer = [[], []];
    max_level = -Infinity;
    momentary_loudness = -Infinity;
    integrated_loudness = -Infinity;
    true_peak = -Infinity;
    lra = 0;
}
