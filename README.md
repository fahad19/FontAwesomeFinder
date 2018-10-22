# FontAwesomeFinder

Instantly search for FontAwesome icons through a web interface.

Visit [https://awesomeiconsearch.com/](https://awesomeiconsearch.com)

## Contributing

Searches are based on FontAwesome's CSS class names, custom keywords, and related icons \(and their keywords\).   
  
You can help make the searches even better by updating the `data.json`file.

### Adding Keywords

Try adding more `keywords` to an icon. An example icon in `data.json` would look like this:


```javascript
"fa-pencil": {
    "name": "fa-pencil",
    "keywords": [
        "utensil",
        "writer",
        "draw",
        "edit",
        "pen",
        "sketch"
    ]
}
```

### Using Inheritance

Try adding icons to the `inherit` property of an icon to inherit the keywords of other icons.

```javascript
"fa-pencil-square-o": {
    "name": "fa-pencil-square-o",
    "inherit": [
        "fa-pencil",
        "fa-square"
    ],
    "keywords": []
}

```

## License

Do whatever you want with this, but credit me and the original author \([@fahad19](https://github.com/fahad19)\), and don't be a turdsplat.

