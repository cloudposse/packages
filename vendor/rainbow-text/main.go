package main

import (
	"fmt"
	"github.com/arsham/rainbow/rainbow"
	"math/rand"
	"os"
	"strings"

	flag "github.com/spf13/pflag"
)

const ExeName = "rainbow"

//go:generate go run scripts/includeversion.go

var showVersion = flag.BoolP("version", "v", false, "output version")

func main() {
	flag.Parse()

	if *showVersion {
		printVersion()
		return
	}
	l := rainbow.Light{
		Reader: os.Stdin,
		Writer: os.Stdout,
		Seed:   rand.Int63n(256),
	}
	l.Paint()
}


func printVersion() {
	fmt.Fprintf(os.Stdout, "%v v%v (Cloud Posse)\n", ExeName, strings.Trim(Version,"\n"))
}
