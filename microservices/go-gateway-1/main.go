package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
)


func handler(w http.ResponseWriter, r *http.Request) {
	nodeService := os.Getenv("NODE_SERVICE")
	if nodeService == "" {
		nodeService = "node-api:3000"
	}

	resp, err := http.Get("http://" + nodeService + "/handle")
	if err != nil {
		http.Error(w, "Error contacting Node service", 500)
		return
	}
	defer resp.Body.Close()

	body, _ := io.ReadAll(resp.Body)
	fmt.Fprintf(w, "Go Gateway → %s", string(body))
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Go service running on port 8080")
	http.ListenAndServe(":8086", nil)
}