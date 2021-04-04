package main

import (
	"io"
	"os"
)

// Reads the VERSION files in the current folder
// and encodes them as strings literals in textfiles.go
func main() {
	out, _ := os.Create("version.go")
	out.Write([]byte("package main \n\nconst (\n"))
	out.Write([]byte("Version = `"))
	f, _ := os.Open("VERSION")
	io.Copy(out, f)
	out.Write([]byte("`\n)\n"))
}
