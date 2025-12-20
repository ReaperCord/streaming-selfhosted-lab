import express from "express";
import dotenv from "dotenv";

dotenv.config();

const app = express();

// Converter PORT para number
const PORT = process.env.PORT ? parseInt(process.env.PORT, 10) : 3000;
const VIDEO_INPUT_PATH = process.env.VIDEO_INPUT_PATH || "./videos/input";

app.get("/health", (_, res) => {
  res.json({ status: "ok" });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Backend running on port ${PORT}`);
});


