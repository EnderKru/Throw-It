# 🏀 Office Basketball Challenge — VR Game

A VR game set in an office environment. Pick up objects from around the room
and throw them into the basketball hoop using realistic velocity-based physics.
Built with **Godot 4** and **OpenXR**.

---

## Idea and Goal

The idea came from the classic office fantasy — throwing paper balls into a
trash bin (real talk). The goal of this project is to bring that experience into
VR with satisfying physical throwing mechanics.

The player stands in a virtual office and can grab various objects around the
room and hurl them into a basketball hoop. When the player releases the grip
button, the object inherits the exact speed and direction the controller was
moving at that moment — making every throw feel direct and physical.

This alpha prototype demonstrates the core interaction loop: **grab → aim →
throw → score** (k. without scores yet).

---

## Demo Video

>No video for now X(

---

## Screenshots

![VR Scene Overview](/screenshots/photo_2026-03-29_10-27-59.jpg)

---

## Done

- [x] VR scene setup with OpenXR
- [x] Office environment — room, desk, basic props
- [x] Throwing mechanic
- [x] Grabbable objects system

---

## To Be Done

- [ ] Score detection on basketball hoop 
- [ ] Score counter UI visible in VR
- [ ] Sound effects (object pickup, throw, hit, score)
- [ ] Object respawn after each throw
- [ ] More grabbable object types and variety
- [ ] Improved office environment with additional props and detail

---

## Steps Completed

1. **OpenXR project setup** — configured Godot 4 project with OpenXR plugin,
set up the XR node tree for head and both hand controllers.
2. **Office scene** — built a basic enclosed office room with a desk as the main
interaction surface.
3. **Grabbable system** — implemented a grab mechanic tied to the controller
grip button; any tagged object in range can be picked up by either hand.
4. **Throwing** — on grip release, the held object receives the controller's
linear velocity, producing natural and responsive throws.

---

## Credits

Assets used:

https://sketchfab.com/3d-models/office-6e466635ecd54eb1a271eba14478b0db
https://sketchfab.com/3d-models/office-door-18c91651e575451bb5548c563554be82
https://sketchfab.com/3d-models/basketball-hoop-b204390d9946451c8075a292e2d3de61
https://sketchfab.com/3d-models/pen-holder-a58fad32087a40a7b51bae0c1565776a
https://sketchfab.com/3d-models/rubix-cube-9e2959eb705e4a4db81a21406de27336
https://sketchfab.com/3d-models/shot-glass-b5c053f7dbcb42d69e0475f3a0d4c257
https://sketchfab.com/3d-models/jephson-task-lamp-black-838a8eabfba64e82950581810d152281
https://sketchfab.com/3d-models/pen-16b1e400f50e4f56a605f8f02468881f
https://sketchfab.com/3d-models/stapler-eb02cd20aafd4e21bc1a5f3252e8a914
https://sketchfab.com/3d-models/scissors-48161a88fb9b4982ad2dbefa137e652d
https://sketchfab.com/3d-models/standard-calculator-f9945610ba8f40679ff07c690d4560f0
https://sketchfab.com/3d-models/bulldog-smoking-pipe-d995ebacdc304433b39cc9a1b9e2b13b
https://sketchfab.com/3d-models/simple-pill-bottle-21f392ee64fb4297a578a1ae210dcb33
https://sketchfab.com/3d-models/office-stamp-18890f7a234a407a85bb9a1509ef4b8f

---

## Built With

- [Godot 4](https://godotengine.org/) with OpenXR
- Target device: Meta Quest 2 / 3

---

## How to Run

1. Clone the repository
2. Open the project in **Godot 4.x** with the OpenXR plugin enabled
3. Connect your VR headset
4. Press **Run**
