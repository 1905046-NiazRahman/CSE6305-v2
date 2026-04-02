import networkx as nx
import matplotlib.pyplot as plt

# Create bipartite graph
G = nx.Graph()

# --- Nodes ---

# CWE nodes
cwes = [
    "CWE-787", "CWE-125", "CWE-119", "CWE-122",
    "CWE-129", "CWE-131", "CWE-190",
    "CWE-416", "CWE-476", "CWE-664", "CWE-825"
]

# CVE nodes
cves = [
    "CVE-2026-25541", "CVE-2024-28854", "CVE-2020-35881",
    "CVE-2021-25900", "CVE-2023-30630", "CVE-2019-12083",
    "CVE-2024-24576", "CVE-2022-41717", "CVE-2023-24538",
    "CVE-2021-33196", "CVE-2020-28362", "CVE-2022-30635",
    "CVE-2023-39325", "CVE-2025-46333", "CVE-2024-41920",
    "CVE-2022-32893", "CVE-2023-28205", "CVE-2021-1782",
    "CVE-2020-27930", "CVE-2023-23529"
]

# Add nodes with bipartite attribute
G.add_nodes_from(cwes, bipartite=0, color='red')
G.add_nodes_from(cves, bipartite=1, color='blue')

# --- Edges (CWE → CVE relationships) ---
edges = [
    ("CWE-787", "CVE-2026-25541"),
    ("CWE-190", "CVE-2026-25541"),
    ("CWE-131", "CVE-2026-25541"),

    ("CWE-125", "CVE-2024-28854"),
    ("CWE-125", "CVE-2022-41717"),
    ("CWE-125", "CVE-2023-24538"),

    ("CWE-119", "CVE-2020-35881"),
    ("CWE-122", "CVE-2020-35881"),

    ("CWE-416", "CVE-2021-25900"),
    ("CWE-664", "CVE-2021-25900"),

    ("CWE-476", "CVE-2023-30630"),

    ("CWE-129", "CVE-2024-24576"),

    ("CWE-416", "CVE-2021-1782"),
    ("CWE-825", "CVE-2021-1782"),

    ("CWE-416", "CVE-2020-27930"),

    ("CWE-787", "CVE-2022-32893"),
    ("CWE-787", "CVE-2023-28205"),

    ("CWE-131", "CVE-2023-23529"),
    ("CWE-119", "CVE-2023-23529"),
]

G.add_edges_from(edges)

# --- Layout ---
pos = nx.spring_layout(G, k=0.5)

# Color mapping
colors = [G.nodes[n].get('color', 'gray') for n in G.nodes]

# Draw
plt.figure(figsize=(12, 8))
nx.draw(G, pos, with_labels=True, node_color=colors, node_size=1200, font_size=8)
plt.title("CWE → CVE Bipartite Graph (Memory Safety)")
plt.show()