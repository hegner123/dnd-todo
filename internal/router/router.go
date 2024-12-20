package router

import (
	"fmt"
	"net/http"
	"os"
)

type Router struct {
	Request        *http.Request
	ResponseWriter http.ResponseWriter
	Data           []string
}

func New(w http.ResponseWriter, r *http.Request) *Router {
	return &Router{ResponseWriter: w, Request: r}
}

func (r *Router) Match() *Router {
	switch {
	case r.Request.URL.Path == "/":
		r.Data = []string{"base", "head", "body", "home"}
	case r.Request.URL.Path == "/form":
		r.Data = []string{"base", "head", "body", "form"}
	}
	return r

}

func (r *Router) Respond() error {
	f, err := os.ReadFile("./templates/index.html")
	if err != nil {
		fmt.Println(err)
	}
	_,err = r.ResponseWriter.Write(f)
	if err != nil {
        fmt.Println(err)
	}

	return nil
}
