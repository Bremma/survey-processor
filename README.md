# survey-processor
Small script to download images and names for a matched name and picture Slideshow using OBS. Main goal is formatted names text file and folder of downloaded and renamed images.

Directions to use this script. Orinally developed for Cats/Pets of MAGFest, so step are slightly specific to that

Requirements:
- .csv file with List of Names in Col2 and Gdrive Links in Col3 (or adjust the script)
- https://github.com/wkentaro/gdown for sanely downloading files so the images can be renamed with the right exension (because Windows and possibly also OBS)

Steps:
1. Trim CSV to columns and rows wanted
2. Shuffle file
3. Ensure files are accessible to people with link while the script runs
4. Run `survey_processor.sh <file.csv>
5. Wait!
6. Should have a folder called 'processed' at the end with all images numbered 3-N+3, and a file called 'names' with all of the strings in the name column
7. Remove EXIF data cause OBS is dumb in many ways #Note to 2025 prep Heather (verify OBS is still dumb, might be better now!)
        a. Get exiftool for windows
        b. Place in dir above images
        c. Call with 'exiftool.exe'  -all:all= -r /path/to/files/ -overwrite-original folder/*
8. Check and fix image orientation and check for any images that need editing/removal/improvement
7. Now do OBS and Lightworks Magic!

Tips for setting up Slideshow Recording

1. Resize the images to unify sizes when putting into OBS. Used to also be needed because of a 250MB limit on images in Image Slideshow in OBS, but that has been patched and I was able to create and use a 200 image slideshow in testing!
2. How to sync slideshows in OBS

This does not behave by default! This is not foo proof but a workable process to get them working

Create a text and image slideshow. ensure they both have the same delay between 'slides'
Add some counters to the top of the names list to sync in the video with the text:

"Sync


Press Play on Images in X


Starting...

 [emtpy space]  "

Where X is the time delay between slides in both slideshows. It is also beneficial to not let the slideshows loop and hide them when complete!
 
Then include 2 logo images before the 3rd image called  1 and 2. 

Ensure both slideshows are stopped and start recording

Start the text slideshow
Count for X seconds when you see that message, and then start the image slideshow.

Wait for the first image and namw to show up. If the sync looks good, great! Let it play and stop the recording once it is done (eg images and names stop running!)

If not, stop the recording and slide shows, and try again!

Happy Slideshowing!
