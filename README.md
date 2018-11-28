# PrestoQ iOS Coding Exercise

## Overview

To introduce PrestoQ to your coding style and technique, we'd like you to do a small coding exercise. This is not a coding test where we give you a score or run it through a suite of tests for correctness.

Our hope is that we can use this to seed a discussion that provides us with an understanding of your design and coding abilities and you with an idea of what working at PrestoQ will be like. We believe this better reflects what engineers do than coding common patterns on a white board does.

## What We're Looking For

Think of this as real code you would be checking in. PrestoQ values self-descriptive, [SOLID](https://en.wikipedia.org/wiki/SOLID), maintainable, testable designs and code.

## Overview
Grocery store managers often pick products to put on "manager's special." These products are chosen in order to drive customers to the store and increase basket size. PrestoQ has a tool that allows managers to select which product they want to place under "manager's specials" as well as the dimensions of product frame.

## Product Requirements
* There is a service endpoint: /stores/{storeId}/specials that returns a list of products that are on the "manager's special"
* "Manager's specials" change periodically; at any moment a store manager could decide to add or remove a product.
* Order is important as the store managers will select more important items to display first.
* The goal is to fit as many products on the screen as they conform to the specified product frames.
* All "manager's special" products should be viewable.
* If the combined width of the product frames exceeds the full width of the phone move the product frame to the next line and center any frames that do not fit in the full width frame.

### Specials Endpoint
* The endpoint will specify a canvasUnit which is used to specified the dimensions of each product frame (the height and width of the frame will be using canvasUnit). The canvasUnit will determine how many divisible units fits into the full width of the phone. 
** For example: if the canvasUnit is 8 and the total width fo the phone is 360px then each unit is 360px/8 = 45px. Which means given a product frame a width of 6 canvasUnit and a height of 3 canvasUnit, the product frame would be 270px (width) by 135px (height).
* No product frame will have a width greater than the canvasUnit

### Sample Response
```
{  
   "canvasHeight":16,
   "heroCoupons":[  
      {  
         "imageUrl":"https://github.com/prestoqinc/code-exercise-ios/blob/master/images/031146033348.png",
         "width":16,
         "height":8,
         "display_name":"Noodle Dish with Roasted Black Bean Sauce",
         "original_price":"2.00",
         "price":"1.00"
      },
      {  
         "imageUrl":"https://github.com/prestoqinc/code-exercise-ios/blob/master/images/028400240185_CF___GS1_JPEG.JPG",
         "width":8,
         "height":8,
         "display_name":"Onion Flavored Rings",
         "original_price":"2.00",
         "price":"1.00"
      },
      {  
         "imageUrl":"https://github.com/prestoqinc/code-exercise-ios/blob/master/images/041390000034_CF___GS1_JPEG.JPG",
         "width":8,
         "height":8,
         "display_name":"Kikkoman Less Sodium Soy Sauce",
         "original_price":"2.00",
         "price":"1.00"
      }
   ]
}
```

![Manager's Special Mock](https://github.com/prestoqinc/code-exercise-ios/blob/master/managerSpecials.png "Manager's Special Mock")

## Standard Requirements
* Complete this project on your own
* Use a GitHub repository for source control
  * Email the link to the GitHub repository when you are finished
  * The readme.md file should include (at a minimum)
    * Instructions for running the project
    * Any other information you would normally include when you author a readme
  * This code is your intellectual property
    * License it however you'd like (MIT, Apache or Public Domain are great choices)
    * Ensure the license you choose allows PrestoQ employees to read, build, and execute the code for free
* Email your PrestoQ contact the link to the GitHub repository when you're ready to submit your project

If you have any questions, don't hesitate to reach out to your PrestoQ contact
