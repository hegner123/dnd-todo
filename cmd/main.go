package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"

	bhtml "github.com/hegner123/dnd-todo/internal/build_html"
	"github.com/hegner123/dnd-todo/internal/config"
	"github.com/hegner123/dnd-todo/internal/router"
)

var useSSL bool
var Config config.Config

func main() {
	useSSL = false
	fmt.Println("main function")
	err := Config.LoadConfig("config.json")
	if err != nil {
		log.Fatal(err)
	}
	err = bhtml.InitTemplates(nil)
	if err != nil {
		log.Fatal(err)
	}

	// Use http.FileServer to serve files from the static directory
	mux := http.NewServeMux()
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		s := strings.Split(r.URL.Path, "/")
		if s[1] == "public" {
			wd, err := os.Getwd()
			if err != nil {
				fmt.Println(err)
			}
			filePath := r.URL.Path
			segments := strings.Split(filePath, "/")

			if len(segments) > 1 {
				segments = segments[1:]
			}
			trimmedPath := wd + "/" + strings.Join(segments, "/")
			fmt.Println(trimmedPath)
			file, err := os.Open(trimmedPath)
			if err != nil {
				http.NotFound(w, r)
				return
			}
			defer file.Close()
			info, _ := file.Stat()
			http.ServeContent(w, r, info.Name(), info.ModTime(), file)
		} else {

			R := router.New(w, r)
			err := R.Match().Respond()
			if err != nil {
				log.Fatalln(err)
			}
		}

	})

	if !useSSL {

		log.Printf("\n\nServer is running at https://localhost:%s\n", Config.SslPort)
		err := http.ListenAndServeTLS(":"+Config.SslPort, "./certs/localhost.crt", "./certs/localhost.key", mux)
		if err != nil {
			log.Fatalf("Failed to start server: %v", err)
		}
	}
	log.Printf("\n\nServer is running at http://localhost:%s\n", Config.Port)
	err = http.ListenAndServe(":"+Config.Port, mux)
	if err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}

}
