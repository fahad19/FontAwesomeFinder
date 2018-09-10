# FontAwesomeFinder

Instantly search for FontAwesome icons through a web interface.

Visit [https://hostsimple.co/misc/fontawesome-search/](https://hostsimple.co/misc/fontawesome-search/)

## Contributing

Searches are based on FontAwesome's CSS class names, custom keywords, and related icons \(and their keywords\).   
  
You can help make the searches even better by updating the `data.json`file.

### **Adding Keywords**

Try adding more `keywords` to an icon. An example icon in `data.json` would look like this:

{% code-tabs %}
{% code-tabs-item title="data.json" %}
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
{% endcode-tabs-item %}
{% endcode-tabs %}

### Using Inheritance

Try adding icons to the `inherit` property of an icon to inherit the keywords of other icons.

{% code-tabs %}
{% code-tabs-item title="data.json" %}
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
{% endcode-tabs-item %}
{% endcode-tabs %}

## License

Do whatever you want with this, but credit me and the original author \([@fahad19](https://github.com/fahad19)\), and don't be a turdsplat.

