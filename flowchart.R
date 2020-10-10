DiagrammeR::grViz("digraph {

graph [layout = dot, rankdir = LR]

node [shape = rectangle, style = filled, fillcolor = blue, fontcolor = white]

start [label = 'Start']
a [label = 'A']
b [label = 'B']

# edge definitions with the node IDs
{start}  -> {a, b}
}")