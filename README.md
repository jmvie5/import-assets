# import_assets
Bash script to import multiple assets into a typescript or javascript project.

# Why?
Too often I had to import many assets into a web project by copying paths and typing `import file from 'PATH'`. No more! This automate the process to create a clean index file from with I can use the assets into my project.

# Add globaly
1. Clone the repo somewhere in your system.
2. Make sure you give permission to execute main.sh `chmod +x ~/path/to/import_assets/main.sh`
# MacOS
3. Go in your .bash_profile and add the following line `alias import-assets='~/path/to/import_assets/main.sh'`
4. You can now use `import-assets` globaly.

# Usage

Go in the directory you want to create an index file for your assets and run `import-assets` with as many extentions as you want. i.e. `import-assets jpg png svg`

Voilà! You can now go and use your assets in your project.

Disclamer : may be full of bugs and unwanted behaviours, I don't know what I'm doing. But hey, MIT licensed go nuts with it!