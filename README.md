# supercollider-experiments
Recreating chord progressions in SuperCollider of my favorite melodies by following basic Piano tutorials 

## Run
- Install [SuperCollider](https://supercollider.github.io/)
- Copy code into IDE
- CMD + B to boot server
- Place cursor anywhere in code block and hit CMD + Return

## Save
- Prepare to save recording as a .wav file
  ```
  s.prepareForRecord;
  ```
- Hit record
  ```
  s.record;
  ```
- Stop recording
  ```
  s.stopRecording;
  ```
- Recordings are saved under /Users/your_username/Music/SuperCollider Recordings

## Process
### Disclaimer
I do not know music theory. I don't think in octaves and notes (yet). I do think in numbers and patterns. Math and Music go hand in hand for me so, SuperCollider is just a fun way for me to reverse-engineer melodies I like, experiment with sound design, and appreciate music and those who make it more :)
### Logic
- Every key in a piano corresponds to a MIDI number
- The center of a piano is a middle C, or C4, which is the MIDI number 60
- So for any tutorial, I first figure out where C4 is and then label the keys by counting up or down
- Every white key means count++ but if there's a black key between two white keys, count += 2
- I list down the chord progression in a sequence, usually in sets of 3 or 4, and plug it into a Pbind in SuperCollider
- I set the duration for each note by ear -- easiest way is to play the tutorial in my left airpod and focus on the Pbind's pace using my right ear and try to layer them

## Works
Older experiments that I made back in college when I was part of the Santa Clara Laptop Orchestra
- [Home](https://sccode.org/1-5b9) created a soundscape of my hometown by playing around with Imagine Dragons' Demons (2018)
- [The Scientist](https://sccode.org/1-5aS) remixed Coldplay's The Scientist through amplitude modulation and frequency modulation (2018)
