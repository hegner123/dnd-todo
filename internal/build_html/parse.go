package bhtml

import (
	"fmt"
	"html/template"
)

var ParsedFiles *template.Template

func InitTemplates(src *string) error {
	var parsed *template.Template
	var err error

	if src != nil {
		// Use the provided source path
		parsed, err = template.ParseGlob(*src)
		if err != nil {
			return fmt.Errorf("failed to parse templates from %s: %w", *src, err)
		}
	} else {
		// Use the default path
		parsed, err = template.ParseGlob("templates/*.html")
		if err != nil {
			return fmt.Errorf("failed to parse templates from default path: %w", err)
		}
	}

	// Assign to the global variable if parsing is successful
	ParsedFiles = parsed
	return nil
}

type Node struct {
	Data   any
	Next *Node
    Previous *Node
    
}
type ContentTree struct {
	Root Node
}
type HTML struct {
	Name     string
	Template *template.Template
	Data     any
	Use      []string
	Head     string
	Body     string
	Content  ContentTree
}

func (h HTML) BuildTemplate() *template.Template {
	t := template.New(h.Name)
/*    ct:= ContentTree{}
    for _,v:=range h.Use{
        n:= Node{Data: v}

    }
*/
	return t
}
