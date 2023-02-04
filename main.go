package main

import (
    _ "embed"
    "fmt"
    "os/exec"
    "strings"
	"os"
)

//go:embed script.sh
var script string

func main() {
	arg1 := os.Args[1]
	arg2 := os.Args[2]
    c := exec.Command("bash","-s","-", arg1, arg2)
    c.Stdin = strings.NewReader(script)

    b, e := c.Output()
    if e != nil {
        fmt.Println(e)
    }
    fmt.Println(string(b))
}
