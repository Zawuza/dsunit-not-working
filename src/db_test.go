package database

import (
	"testing"

	_ "github.com/lib/pq"
	"github.com/viant/dsunit"
)

func TestMyDatabaseIsEmpty(t *testing.T) {
	// dsc.Logf = dsc.StdoutLogger
	if !dsunit.InitFromURL(t, "testdata/init.yaml") {
		t.Fatal("Init failed")
	}
	if !dsunit.PrepareFor(t, "dsunittestdb", "testdata", "db_is_empty_case") {
		t.Fatal("Prepare failed")
	}
}
