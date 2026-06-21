# 🌐 Premium Developer Portfolio (Flutter Web)

A highly interactive, visually striking, and animated professional portfolio built completely using Flutter Web. This project showcases responsive design, advanced vector animations, and cross-platform UI engineering.

## 🔗 Live Demo
👉 **[View My Portfolio Live Here](https://priyanshunegi10.github.io/portfolio/)

---

## 💡 Engineering & Performance Optimization
Building a heavy interactive portfolio on Flutter Web requires strict constraints:
* **Asset Optimization:** SVGs (`flutter_svg`) are used instead of heavy PNGs to reduce the initial load payload.
* **Dynamic Typography:** Integrated `auto_size_text` alongside layout constraints to ensure text scales fluidly across ultra-wide monitors down to small mobile screens without breaking bounds.
* **Deferred Animations:** Complex Rive states and Flutter Animate sequences are lifecycle-managed to prevent dropped frames (jank) during web rendering.

---

## 🚀 Core Features & UI Components

* **Interactive Vector Animations:** Uses `Rive` for lightweight, interactive, and state-driven runtime micro-animations.
* **Fluid Motion Design:** Leverages `flutter_animate` for staggered, clean, and professional entry transitions for text and project cards.
* **Virtual Device Previews:** Integrates `device_frame` to showcase mobile application mockups directly inside the browser wrapped in accurate device mockups.
* **Universal Links:** External redirections (LinkedIn, GitHub, Resume download, Email) are safely handled asynchronously via `url_launcher`.
* **State-Driven Theme/UI Control:** Scaled architecture using `Provider` to maintain state consistency across multiple sections.

---

## 🛠️ Tech Stack & Dependencies

* **Framework:** Flutter Web (Stable Channel)
* **State Management:** `provider` (^6.1.5+1)
* **Animation Engines:** `rive` (^0.11.17) & `flutter_animate` (^4.5.2)
* **Mockup Rendering:** `device_frame` (^1.4.0)
* **Typography & Vector:** `google_fonts` (^8.0.0), `auto_size_text` (^3.0.0), `flutter_svg` (^2.2.3)
* **Icons & Components:** `font_awesome_flutter` (^10.12.0) & `custom_button_builder` (^0.0.4)
* **Deep Linking:** `url_launcher` (^6.3.2)

---

## 📸 Architectural Showcase

<p align="center">
  <video src="https://github.com/user-attachments/assets/7565dbe6-271c-4937-9291-b091ce969ea8" width="250" autoplay loop muted playsinline></video>
</p>


---

## ⚙️ Local Development & Setup

### Prerequisites
Ensure you have the Flutter SDK installed and configured for Web development.
```bash
flutter doctor
```

## 🚀 Installation & Setup

**1. Clone the project:**
`git clone https://github.com/priyanshunegi10/portfolio`

**2. Install dependencies:**
`flutter pub get`

**3. Run Development Server:**

```Bash
flutter run -d chrome
```

**4. Production Web Build Generation:
To build the highly optimized release bundle with canvaskit/html web renderers:

```Bash
flutter build web --release --base-href "/portfolio/"
```


