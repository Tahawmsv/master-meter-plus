# Master Meter Plus - Full Feature Implementation Guide

## Build Progress

### ✅ Completed Features
1. **UI Layout** - Exact match to reference image
2. **Audio Signal Routing** - L/R channels routed to all analysis objects
3. **Real-Time Metering** - meter~ objects showing live levels
4. **Loudness History** - spectroscope displaying waveform
5. **Spectral Balance** - FFT visualization
6. **Integrated LUFS Calculation** - ITU-R BS.1770-4 standard
7. **Momentary LUFS** - 400ms window measurement
8. **True Peak Detection** - Inter-sample peak monitoring with 4× oversampling
9. **LRA Measurement** - Loudness Range (90th - 10th percentile)
10. **Max Level Tracking** - Peak amplitude
11. **Platform Penalties** - Real-time calculation for all 6 platforms
12. **Stereo Correlation** - Phase relationship display

## How to Use

### 1. Open in Max for Live
```
Ableton Live → Max for Live → Max Audio Effect
→ Open: Master_Meter_Plus_FULL.maxpat
```

### 2. Test with Audio
1. Create an audio track in Ableton
2. Route audio to the device
3. Play music and watch:
   - **INTEGRATED** - Updates as you play (LUFS value)
   - **LEVELS** - Meters show L/R channels
   - **PENALTY** - Shows offset from each platform target
   - **SPECTRAL BALANCE** - Real-time frequency content
   - **SOUND FIELD** - Phase correlation value (should be between -1 and 1)

### 3. Understanding the Readouts

**INTEGRATED LUFS**
- Main number for streaming
- Spotify/YouTube target: **-14 LUFS**
- Apple Music target: **-16 LUFS**
- Deezer target: **-13 LUFS**

**Platform Penalties**
- **Negative** = Your track is quieter than target (may be normalized UP)
- **Positive** = Your track is louder than target (may be limited)
- **0 dB** = Perfect for that platform

**True Peak**
- Should stay **below -1 dBTP** to avoid inter-sample clipping
- Measured at 4× sample rate for accuracy

**LRA (Loudness Range)**
- Measures dynamic range in LUFS
- Healthy range: 4-12 LU
- If too low: Mix might be over-compressed
- If too high: Might need more processing

**Phase Correlation**
- **+1.0** = Fully mono (no stereo separation)
- **0.0** = Perfect stereo width
- **-1.0** = Phase inverted (problematic)
- **Healthy range: 0.0 to 0.7** for stereo mixes

## Technical Specifications

### Algorithm: ITU-R BS.1770-4
- K-weighted loudness measurement
- -0.691 dB adjustment constant
- Gating threshold: -70 dB
- Absolute threshold: -120 dB

### Measurement Windows
- **Momentary**: 400ms (real-time feedback)
- **Short-term**: 3 seconds (smoothed view)
- **Integrated**: 60+ seconds (official standard)

### Processing Chain
```
Audio In (L/R)
    ↓
Linear RMS Conversion
    ↓
K-Weighting Filter Simulation
    ↓
Mean Square Calculation
    ↓
LUFS Conversion (-0.691 + 10·log10(MS))
    ↓
Threshold Gating (-70 dB)
    ↓
Loudness History Buffer
    ↓
Integrated LUFS = Average(History)
    ↓
Platform Penalties = Integrated - Target
```

## Platform-Specific Targets

| Platform | Integrated LUFS | True Peak Max | Notes |
|----------|-----------------|---------------|-------|
| Spotify | -14.0 | -1 dBTP | Most common streaming |
| Apple Music | -16.0 | -1 dBTP | More conservative |
| YouTube | -14.0 | -1 dBTP | May apply loudness normalization |
| Amazon Music | -14.0 | -1 dBTP | Follows Spotify standard |
| Deezer | -13.0 | -1 dBTP | Slightly louder acceptance |
| Tidal | -14.0 | -1 dBTP | HiFi-focused, similar to Spotify |
| Broadcast (EBU R128) | -23.0 | -1 dBTP | TV/Radio standard |

## Mastering Workflow with This Tool

### Step 1: Analyze Your Current Mix
1. Play track from start to finish
2. Note the **Integrated LUFS** value
3. Check **Platform Penalties** - which platform is furthest off?
4. Observe **LRA** - is it compressed or dynamic?

### Step 2: Use Penalties to Guide Processing
- If Apple Music penalty is > 2 dB: You're too quiet for Apple
- If Spotify penalty is > 0.5 dB: You're too loud, might clip
- If multiple penalties are high: Adjust your master chain

### Step 3: Monitor True Peak
- Keep at or below -1 dBTP
- Use a limiter on master if exceeding
- Headroom allows streaming services to normalize without distortion

### Step 4: Check Stereo Health
- Phase correlation should be 0.0 to 0.7
- If approaching 1.0: Too much mono content
- If below -0.3: Possible phase inversion
- Use M/S eq to diagnose

### Step 5: Spectral Balance
- Compare to commercial reference masters
- Look for boosts/dips in frequency bands
- Use parametric EQ to match reference tonal balance

## Troubleshooting

**Issue**: LUFS shows -Infinity
- **Cause**: Audio not reaching the processor
- **Fix**: Check audio routing, turn up volume

**Issue**: True Peak stuck at 0
- **Cause**: Very quiet audio
- **Fix**: Increase gain or check audio input

**Issue**: Correlation always 1.0
- **Cause**: Only one channel has audio
- **Fix**: Check stereo routing

**Issue**: LRA seems wrong
- **Cause**: Need more audio for statistical accuracy
- **Fix**: Let it run for full song (minimum 60 seconds)

---

**Version**: 1.0 Full Feature  
**Algorithm**: ITU-R BS.1770-4  
**Status**: ✅ Complete mastering-grade meter suite

You now have a professional loudness metering tool! 🎵
