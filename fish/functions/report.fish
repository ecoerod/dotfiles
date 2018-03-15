function report
    pandoc $argv[1] -t latex --template class.tex -s -o $argv[2] --pdf-engine-opt=-shell-escape
end
