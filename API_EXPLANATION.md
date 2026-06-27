# How the AI Works: Simple Explanation 🤖

This document explains how our app "talks" to the AI in simple terms.

## 1. The Big Picture
Think of the app like a **Messenger**.
- **You** (the user) write a message.
- **The App** sends that message to a smart computer (the **AI Server**).
- **The AI Server** thinks and sends a reply back.
- **The App** shows that reply on your screen.

---

## 2. Step-by-Step Flow

### Step A: You type a message
When you type "Hello" in the chat box and hit send, the `chat_screen.dart` file takes that text. It immediately adds your bubble to the screen so you can see what you sent.

### Step B: The App prepares the "Letter"
The app uses a service called `ApiService` (found in `lib/api/api.dart`). This service creates a digital "letter" (called a **POST Request**) that contains:
1.  **The Key**: A secret password (`API_KEY`) so the server knows it's us.
2.  **The Model**: The name of the AI we want to use (like choosing which expert to talk to).
3.  **The Message**: Your actual text.

### Step C: Sending the Letter (The API Call)
The app sends this letter over the internet to a website called **OpenRouter**. 
- While waiting, the app shows a **Loading Spinner** so you know the AI is thinking.

### Step D: Getting the Reply
OpenRouter sends back a JSON response (a format computers love). Our app "unwraps" this response to find the exact text the AI wrote.

### Step E: Showing the Reply
The app takes that text and adds a new bubble to the chat list. It stops the loading spinner and scrolls down so you can read it.

---

## 3. Key Parts We Used

- **`http` package**: This is like the "Mailman" that carries our messages across the internet.
- **`flutter_dotenv`**: This is a "Safe" where we hide our secret API Key so it doesn't get stolen.
- **`jsonEncode` & `jsonDecode`**: This is like a "Translator" that converts our Dart code into a language the AI server understands.

## 4. Why OpenRouter?
We use OpenRouter because it acts as a bridge to many powerful AI models (like DeepSeek). It allows our app to be very smart without needing a huge server of its own!
