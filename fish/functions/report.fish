function report
    set file (string match -r "(.*)\.[^\.]*\$" $argv[1])[2]
    set output $file".tex" 
    pandoc $argv[1] -t latex --template class.tex -s -o $output --filter pandoc-minted
    rubber --unsafe -d $file
    rubber --clean $file
    rm $output
end
