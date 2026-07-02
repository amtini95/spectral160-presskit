SPECTRAL160 — PRESS KIT
=======================

Everything is editable without touching code. Photos and video are just files
in /media. Links (SoundCloud, Instagram...) are one small block at the top of
the script in index.html.

QUICK START
-----------
Open index.html. Keep the /media folder next to it. Done.

FOLDER
------
spectral160-presskit/
  index.html
  media/            <- all photos + video live here
  README.txt

=====================================================================
CHANGE ANY PHOTO OR VIDEO  ->  just replace the file in /media
=====================================================================
Use these EXACT names (same name = it swaps automatically, no code):

  media/logo.jpg     Hero artwork / logo
  media/photo1.jpg   Gallery 01   (tall)
  media/photo2.jpg   Gallery 02
  media/photo3.jpg   Gallery 03
  media/photo4.jpg   Gallery 04   (wide)
  media/photo5.jpg   Gallery 05
  media/promo.mp4    Promo video

- To change a photo: drop your image in /media with that name, replacing the
  old one. Refresh the page. That's it.
- To change the video: put your clip in /media named promo.mp4 (H.264 .mp4
  plays everywhere). Replace it any time to update it.
  Vertical (9:16) OR horizontal (16:9) both work — the player adapts to the
  clip: vertical shows phone-shaped and centered, horizontal shows wide.
- Slots with no file yet show a marked "Drop photo" placeholder until you add one.
- Already included: logo.jpg, photo1.jpg (alley), photo2.jpg (cemetery).
  You still need to add: photo3, photo4, photo5, promo.mp4.

Tip: keep photos vertical-ish (portrait/square) and under ~2000px wide so the
page stays fast. Video: mp4, ideally under ~30 MB.

=====================================================================
CHANGE LINKS  ->  edit the CONFIG block at the top of index.html
=====================================================================
Open index.html, near the bottom find "EDIT YOUR LINKS HERE":

  const CONFIG = {
    email:      "spectral160techno@gmail.com",
    whatsapp:   "5493517594919",                 // digits only
    instagram:  "https://instagram.com/spectral160",
    igHandle:   "@spectral160",
    soundcloud: ""    // <- paste your SoundCloud set URL here
  };

Everything (contact rows + footer + the Listen card) updates from these values.
Leave soundcloud empty and the card just prompts you to add it.

(Optional) Real embedded SoundCloud player instead of a link:
On SoundCloud open your set -> Share -> Embed -> copy the <iframe>, then in
index.html replace the whole <a class="sc-play" ...>...</a> block with it.
A comment marks the exact spot.

HOSTING (optional public link)
------------------------------
Drag the whole folder into Netlify / Cloudflare Pages / GitHub Pages / S3.
Relative /media paths just work.

Local full preview (video + all photos loading from files):
  cd spectral160-presskit
  python3 -m http.server 8080   ->   http://localhost:8080

NOTES
-----
- Language: English. Say the word and I switch it to Spanish or bilingual.
- Booking form has no backend: on submit it opens the visitor's mail app with
  everything pre-filled to your email. Nothing to host.
- The FALLBACKS block in the script only exists so the page still shows your
  logo/photos when index.html is opened ALONE with no /media folder (like a
  quick preview). Once /media is in place the files always win; you can delete it.
