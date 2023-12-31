const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");

const authrouter = express.Router();

authrouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });

    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with this email already exists" });
    }

    const hashPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      name,
      email,
      password: hashPassword,
    });

    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = authrouter;
