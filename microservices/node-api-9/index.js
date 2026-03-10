const express = require("express");
const axios = require("axios");

const app = express();

const PYTHON_SERVICE = process.env.PYTHON_SERVICE || "python-worker:5000";

app.get("/handle", async (req, res) => {
    try {
        const response = await axios.get(`http://${PYTHON_SERVICE}/process`);
        res.send("Node received → " + response.data);
    } catch (error) {
        res.status(500).send("Error contacting Python service");
    }
});


app.listen(3000, () => {
	console.log("Node Service running on port 3000");
});
