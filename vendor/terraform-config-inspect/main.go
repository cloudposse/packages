package main

import (
	"encoding/json"
	"fmt"
	"os"
	"strings"
	
	"github.com/hashicorp/terraform-config-inspect/tfconfig"
	flag "github.com/spf13/pflag"
)

//go:generate go run scripts/includeversion.go
const ExeName = "terraform-config-inspect"

var showJSON = flag.Bool("json", false, "produce JSON-formatted output")
var showVersion = flag.BoolP("version", "v", false, "output version")

func main() {
	flag.Parse()

	var dir string
	if flag.NArg() > 0 {
		dir = flag.Arg(0)
	} else {
		dir = "."
	}

	module, _ := tfconfig.LoadModule(dir)

	if *showVersion {
		printVersion()
	} else if *showJSON {
		showModuleJSON(module)
	} else {
		showModuleMarkdown(module)
	}

	if module.Diagnostics.HasErrors() {
		os.Exit(1)
	}
}

func showModuleJSON(module *tfconfig.Module) {
	j, err := json.MarshalIndent(module, "", "  ")
	if err != nil {
		fmt.Fprintf(os.Stderr, "error producing JSON: %s\n", err)
		os.Exit(2)
	}
	os.Stdout.Write(j)
	os.Stdout.Write([]byte{'\n'})
}

func showModuleMarkdown(module *tfconfig.Module) {
	err := tfconfig.RenderMarkdown(os.Stdout, module)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error rendering template: %s\n", err)
		os.Exit(2)
	}
}

func printVersion() {
	fmt.Fprintf(os.Stdout, "%v v%v (Cloud Posse)\n", ExeName, strings.Trim(Version,"\n"))
}
