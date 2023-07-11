console.log("hello world");
const express = require("express");
// const User = require("./models/user");

const Port = 3000;
const app = express();
//imprt other files
const authrouter = require("./routes/auth");
const { default: mongoose } = require("mongoose");
const Db =
  "mongodb+srv://sanyog:sanyogvks143@cluster0.jawmyyk.mongodb.net/?retryWrites=true&w=majority";
//middleware
app.use(express.json());
app.use(authrouter);

//mangoose
mongoose
  .connect(Db)
  .then(() => {
    console.log("successfully mangodb");
  })
  .catch((e) => {
    console.log(e);
  });

app.get("/hello-world", (req, res) => {
  res.json({ name: "sanyog", age: "18" });
});

app.listen(Port, () => {
  console.log(`your Live port is ${Port}`);
});
