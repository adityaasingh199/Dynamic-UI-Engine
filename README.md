# AppDrop Dynamic UI – JSON to UI Rendering Engine (Flutter + BLoC)

This project implements a **dynamic widget rendering engine** in Flutter where the **entire screen UI is generated from JSON provided by the user at runtime.**

Instead of hardcoding widgets, the app reads a JSON schema (page definition), parses it to Dart models, and renders multiple component types:

- Text Block
- Image Banner
- Image Carousel
- Image Grid
- Video Player


---

## Objective

- Accept JSON from the user (via a text input screen)
- Validate and parse JSON into Dart models
- Use **BLoC** for state management and error handling
- Render widgets dynamically based on the `"type"` field in JSON
- Respect JSON properties such as `height`, `padding`, `spacing`, `autoPlay`, etc.

---

## Supported Components & JSON Format

```json
{ 
  "page": { 
    "components": [ 
       { 
         "type": "text", 
         "value": "Welcome to AppDrop", 
         "size": 20, 
         "font": "xyz", 
         "weight": "bold", 
         "align": "center", 
         "padding": 16 
       },
      { 
        "type": "banner", 
        "image": "https://cdn.example.com/banner.png", 
        "height": 180, 
        "padding": 16 
      }, 
      { 
        "type": "carousel", 
        "images": [ 
          "https://cdn.example.com/c1.png", 
          "https://cdn.example.com/c2.png" 
        ], 
        "height": 200, 
        "autoPlay": true, 
        "padding": 12 
      }, 
      { 
        "type": "grid", 
        "images": [ 
          "https://cdn.example.com/g1.png", 
          "https://cdn.example.com/g2.png", 
          "https://cdn.example.com/g3.png", 
          "https://cdn.example.com/g4.png" 
        ], 
        "columns": 2, 
        "spacing": 10, 
        "padding": 16 
      }, 
      { 
        "type": "video", 
        "url": "https://cdn.example.com/demo.mp4", 
        "autoPlay": false, 
        "height": 250, 
        "padding": 16 
      } 
    ] 
  } 
} 
