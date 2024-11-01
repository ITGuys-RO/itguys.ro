# itguys.ro

## Project Description

This project is the main page for itguys.ro. It includes a countdown timer, smooth scrolling,
and an image carousel. The page is built using HTML, CSS, and JavaScript, and it utilizes several
libraries and plugins for enhanced functionality.

## Features

- **Countdown Timer**: A countdown timer to a specified date.

## Technologies Used

- HTML
- CSS
- JavaScript
- jQuery

## Setup and Installation

1. Clone the repository:
    ```sh
    git clone <repository-url>
    ```
2. Navigate to the project directory:
    ```sh
    cd itguys.ro
    ```
3. Open `index.html` in your browser to view the page.

## Usage

- **Smooth Scrolling**: Click on the "Back to Top" link to smoothly scroll to the top of the page.
- **Countdown Timer**: The countdown timer is set to a specific date and time. You can change the
  date in the `scripts.js` file.
- **Owl Carousel**: The carousel can be customized in the `scripts.js` file.

## Customization

- **Countdown Timer**: Update the date in the `scripts.js` file:
    ```javascript
    $("#countdown").countdown({
        date: "01 January 2026 10:00:00",
        format: "on"
    });
    ```
- **Owl Carousel**: Customize the carousel settings in the `scripts.js` file:
    ```javascript
    $("#commentslider").owlCarousel({
        autoPlay: false,
        autoHeight: true,
        stopOnHover: true,
        navigation: false,
        pagination: true,
        slideSpeed: 500,
        singleItem: true,
        transitionStyle: "backSlide"
    });
    ```
