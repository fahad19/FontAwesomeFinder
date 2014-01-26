# FontAwesomeFinder

Instantly search for FontAwesome icons in the browser.

Visit [http://fahad19.github.io/FontAwesomeFinder](http://fahad19.github.io/FontAwesomeFinder).

## Contributing

Searches are based on FontAwesome's CSS class names, and custom keywords. You can help make the searches even better by updating `data.json` file and adding more keywords.

An example icon in `data.json` would look like:

    {
      "fa-glass": {
        "name": "fa-glass",
        "keywords": []
    }

Now you can add custom keywords so that the glass icon is returned when searched for `drink` OR `wine` too.

    {
      "fa-glass": {
        "name": "fa-glass",
        "keywords": [
          "drink",
          "wine"
        ]
    }

## License

It is released under the MIT License.
