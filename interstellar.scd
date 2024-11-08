// prep server for recording (as a .wav)
s.prepareForRecord;
s.record;

(
// synth to mimic a piano but dreamier ^_^
SynthDef(\harmonic_piano, {
    arg freq = 440, amp = 0.5, dur = 1.0;
    var env, sound, harmonics, reverb;
    env = EnvGen.kr(Env.perc(0.1, 1.5, 1, -4), doneAction: 2);  // Longer attack and release

    // Additive synthesis using sine waves at harmonic frequencies
    harmonics = [
        SinOsc.ar(freq, 0, 0.1),   // Fundamental
        SinOsc.ar(freq * 2, 0, 0.05),  // 2nd Harmonic
        SinOsc.ar(freq * 3, 0, 0.03),  // 3rd Harmonic
        SinOsc.ar(freq * 4, 0, 0.02)   // 4th Harmonic
    ];

    sound = harmonics.sum * env;  // Sum the harmonics and apply envelope

    // Reverb for a more cinematic feel
    reverb = FreeVerb.ar(sound, 0.7, 0.9, 0.5);

    Out.ar(0, reverb * amp);  // Send output to audio
}).add;

/*
Melody: Interstellar by Hans Zimmer
Key in the center of piano = C4 or Middle C = 60 in MIDI number
Chord progression from 00:59 - 01:31 | https://www.youtube.com/watch?v=OQeUvNHR0Ac
*/
~chords = Pbind(
	\instrument, "harmonic_piano",
	\midinote, Pn(Pseq([
		59, 57, 64,
		57, 57, 64,
		57, 59, 64,
		59, 59, 64,
		59, 60, 64,
		60, 60, 64,
		60, 62, 64,
		62, 62, 64,

	]), 2),
	\dur, Pn(Pseq([
		0.4, 0.6, 0.8,
		0.6, 0.8, 0.8,
		0.6, 0.8, 1.0,
		0.5, 0.5, 1.0,
		0.4, 0.6, 0.8,
		0.6, 0.8, 1.0,
		0.5, 0.8, 0.8
	]), 2),
	\ctranspose, 12,
	\att, 0.01,
	\rel, 1.0,
	\amp, 1.5
);

~chords.play();
)
/*
to find recording, open finder, CMD + SHIFT + G
go to /Users/tanyasonker/Music > SuperCollider Recordings
*/
s.stopRecording;