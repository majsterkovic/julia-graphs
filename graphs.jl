using GraphPlot, LightGraphs, Random, Colors

L = []

k = 10
n = ceil(k*(k-1)/2)

for i in 1:n
    push!(L, 0)
end

for i in 1:ceil(Int, n/2)
    L[i] = 1
end

shuffle!(L)

G = DiGraph(k)

counter = 0
for i in 0:k-1
    for j in 0:i-1
        global counter += 1
        if L[counter] == 1
            add_edge!(G, i+1, j+1)
        end
    end
end

gplot(G, nodefillc=distinguishable_colors(nv(G)), nodelabel=vertices(G), layout=circular_layout)