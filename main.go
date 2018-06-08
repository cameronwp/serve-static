package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	dir := os.Args[1]
	port := fmt.Sprintf(":%s", os.Args[2])
	panic(http.ListenAndServe(port, http.FileServer(http.Dir(dir))))
}
