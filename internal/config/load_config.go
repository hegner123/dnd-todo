package config

import (
	"encoding/json"
	"fmt"
	"os"
)

type Config struct {
	Port    string `json:"port"`
	SslPort string `json:"ssl_port"`
}

func (conf *Config) LoadConfig(p string) error {
	f, err := os.ReadFile(p)
	if err != nil {
		return fmt.Errorf("Error reading %s\nerr: %v\n", p, err)
	}
    err=json.Unmarshal(f, conf)
    if err != nil { 
		return fmt.Errorf("err: %v\n", err)
    }
	return nil

}
