# CSS Linter built with Ruby

<!-- ABOUT THE PROJECT -->
## About The Project

This is a simple linter made for CSS, check for good practices in CSS files

## Rules

**Indentation**
* 2 space indentation rule

bad code:
```css
  a {
  color: red;
  }
```

good code:
```css
  a {
    color: red;
  }
```

**Line Format**
* One line checking
* Line missing between css blocks

bad code:
```css
h1 {
  font-family: Helvetica, Arial, sans-serif;
  font-size: 19px;
  color: blue;  
}
h2 {
  color: #111111;
  font-size: 16px;
}
```

good code:
```css
h1 {
    font-family: Helvetica, Arial, sans-serif;
    font-size: 19px;
    color: blue;
}

h2 {
    color: #111111;
    font-size: 16px;
}
```

**Spacing**
* Checking for missing spacing after **:** or **,**
* Checking for no whitespace before  **;** or **:**
* Checking for missing spacing after **{**
* Checking for line break after **{** or **}** and after each property declaration

bad code:

```css
a,p {
    color: red ;
    font-weight: bold;
}

div {
    color: blue;
    font-size : 18px;
}
```

good code:
```css
a, p {
  color: red;
  font-weight: bold;
}

div {
  color: blue;
  font-size: 18px;
}
```


<!-- ABOUT THE PROJECT -->
## Usage

The CSS Linter check your CSS file looking for common error and bad practices. Compare each line with a set of rules.

If an error is found, you can check the error message and the line where is generated.


**Examples**
- Bad Indentation, expected two spaces before property declaration
- Spacing, Expected single space after **:** and **,**
- Spacing, Unexpected spaces before **:** and **,**
- Spacing, Unexpected spaces after **{** or **;**
- Syntax, Good syntax when creating classes or declarations
- Syntax, Expected open and close curly brackets
- Line Format, Unexpected break lines
- Line Format, Expected single break line between classes

## Install

* Install **Ruby** on your computer from [here](https://www.ruby-lang.org/en/downloads/)
  
* [Download](https://github.com/kensayo/CSS-linter/archive/refs/heads/develop.zip) or clone this repo:
    - In case of clone, clone into root directory of your HTML/CSS project
    - Or move you CSS files inside CSS-linter

* Navigate to root directory of _CSS-linter_ folder:
```
$ run-checks
```
![Screenshot](img/screenshot.png)

### Built With
This project was built using these technologies.
* Ruby
* Rspec
* Rubocop
* Ruby Mine

## Contributors

**👤 Kenny Ortega**

- GitHub: [kensayo](https://github.com/kensayo)
- Twitter: [@kensayo](https://twitter.com/kensayo)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/kenny-ortega-3580aa33/)

## :handshake: Contributing
Contributions, issues and feature requests are welcome!
Feel free to check the [issues page](https://github.com/kensayo/CSS-linter/issues)

## Show your support
Give a :star: if you like this project!


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Microverse](https://www.microverse.org/)
* [The Odin Project](https://www.theodinproject.com/)
* [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
