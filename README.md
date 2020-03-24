# TIC TAC TOE

The purpose of this project is to build a pure Ruby Tic-Tac-Toe game for running on the command line of your terminal.
The game is made for two human players to play against each other. For visual purposes, the game board is displayed between turns and player's markers are differentiated by colors.

Project: Object Oriented Programming - Tic Tac Toe

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]




<!-- PROJECT LOGO -->
<br />
<p align="center">
  
  <h2 align="center">Tic Tac Toe</h2>

  <p align="center">
    <br />
    <a href="https://github.com/dansantander/tictactoe"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    ·
    <a href="https://github.com/dansantander/tictactoe/issues">Report Bug</a>
    ·
    <a href="https://github.com/dansantander/tictactoe/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [Getting Started](#getting-started)
* [Instructions](#instructions)
* [About the Project](#about-the-project)
* [Built With](#built-with)
* [License](#license)
* [Contact](#contact)

<!-- GETTING STARTED-->
## Getting Started

For starters, the game will ask for both Player 1 and Player 2 names. Automatically, the game will asign marker 'X' to Player 1 and marker 'O' to player 2. Those will be each player's chips for using throghout the game. Afterwards, a 3x3 cells board will be shown at it's initial state:
<pre>
<code>
 1 | 2 | 3 
---+---+---
 4 | 5 | 6 
---+---+---
 7 | 8 | 9 
</code>
</pre>

Each player will be asked to choose a cell number taking turns. 
Game is won by player who is able to get three of its marks on a straight line, whether it's vertically, horizontally or diagonally.
Scores will be displayed after each game.

<!-- INSTRUCTIONS-->
## Instructions

Download the project in your computer and open terminal/command prompt.
This game uses the 'Colorize' ruby gem to make it easier for players to distinguish between every shot, so you'll need to run command 'gem install colorize' on your terminal.
Then, navigate to the project folder, run command 'bin/main.rb' and off you go! 

<!-- ABOUT THE PROJECT -->
## About The Project

Project built following the next Microverse requirements:

#### Milestone 1: Project Setup

- [x] Setup project as it is described in requirements.
- [x] In addition, create 2 main directories:
lib - for the game logic.
bin - with the [executable file] called main.rb.
- [x] main.rb file should be responsible for user interaction. This is the only one place where puts and get.chomp can be used.
- [x] Make your main.rb file displaying “Hello world!” when you use bin/main.rb as a bash command.

#### Milestone 2: User Interface

- [x] main.rb file should be responsible for user interaction. In this milestone you should only create content in this file.
- [x] Display prompts for users (hint: puts/print), collect user input (hint: get.chomp) and only mock the basic flow of the game.
- [x] Make sure that you can run your game with your executable file and play with the basic flow.
- [x] The final point of this milestone is to make sure that you thought about all actions needed to play Tic Tac Toe. It does not need to work yet - this will be done in the next milestone.

#### Milestone 3: Game Logic

- [x] Add real logic for your game - get rid of all inline comments and mocked logic used in previous milestone.
- [x] As main.rb file should be responsible for user interaction, this is the only(!) one place where puts/print and get.chomp can be used.
- [x] Think how you can encapsulate diffrent parts of game logic in classes. Do not create one class for everything.
- [x] Read about DRY rule and use it.
- [x] Think about the diffrence between attr_readers/attr_writers and atrr_acessors. Use atrr_acessors only if you really need it.
- [x] Remember about single responsibility rule. Always.
- [x] Remember to cover edge cases: think what player could try to do to cheat the game and make sure that your program does not allow to perform invalid action.

#### Milestone 4: Game Instructions and final touches

- [x] Add full description of game rules in README file - remember that some people might not be familiar with Tic Tac Toe game rules.
- [x] Make sure that you informed your players on how to start your game - they might not be programmers.
- [x] Improve anything you want to improve in order to make your game perfect.


Project built making use of to the following lessons:
https://www.theodinproject.com/courses/ruby-programming/lessons/object-oriented-programming


## Built With
Ruby - Programming language used
VS Code - The code editor used

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Daniel Santander - [Github profile](https://github.com/dansantander)<br>
Rodolfo Rodriguez Mata - [Github profile](https://github.com/RodolfoRodriguezMata)<br>
Project Link: [https://github.com/dansantander/tictactoe](https://github.com/dansantander/tictactoe)



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://github.com/RodolfoRodriguezMata/enumerable-methods/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=flat-square
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=flat-square
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=flat-square
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png