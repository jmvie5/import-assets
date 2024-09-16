# import_assets
Bash script to import multiple assets into your React project.

### Why?
Too often I had to import many assets into my React app by copying paths and typing `import file from 'PATH'`. No more! This automates the process to create a clean index file from which I can use the assets in my project.

## Add globally
1. Clone the repo in `~/bin`.
2. Make sure you give permission to run main.sh `chmod +x ~/bin/import_assets/main.sh`

### Linux
3. Create `~/.bash_aliases` file if it does not exist and add the following line `alias import-assets='~/bin/import_assets/main.sh'`
### MacOS
3. Edit `~/.bash_profile` and add the following line `alias import-assets='~/bin/import_assets/main.sh'`


## Usage
Go to the directory where you want to create an index file for your assets and run `import-assets` with as many extensions as you want.

Voilà! You can now go and use your assets in your project.

This will use the filename (before the extension) as the variable for the import. Make sure your files don't start with a number, otherwise the import statement won't work. 

### Example
Directory :
```bash
assets
├── arrowLeftIcon.svg
├── arrowRightIcon.svg
├── cat.jpg
├── dog.png
├── elephant.heic
└── picture.webp
```
Input : `import-assets jpg png svg`

Output :
```typescript
import cat from "./cat.jpg"
import dog from "./dog.png"
import arrowLeftIcon from "./arrowLeftIcon.svg"
import arrowRightIcon from "./arrowRightIcon.svg"

export {
    cat,
    dog,
    arrowLeftIcon,
    arrowRightIcon,
}
```

Disclamer : May be full of bugs and unwanted behavior, I don't know what I'm doing. But hey, MIT licensed, go nuts with it!