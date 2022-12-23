# survey-processor
Small script to download images and names for a matched name and picture Slideshow

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
7. Now do OBS and Lightworks Magic!
