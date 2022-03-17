use LibraryMake;

class Build {
    method build($srcdir) {
        my %vars = get-vars($srcdir);
        %vars<linenoise> = $*VM.platform-library-name('linenoise'.IO).basename;
        mkdir IO::Path.new("$srcdir/resources/libraries") unless "$srcdir/resources/libraries".IO.e;
        say "Processing makefile with %vars";
        process-makefile($srcdir, %vars);
        shell %vars<MAKE>, :cwd($srcdir);
    }
}
