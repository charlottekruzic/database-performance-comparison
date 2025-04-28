# SQLite vs Cassandra performance comparison
[![License: MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg)](https://opensource.org/licenses/MIT)

## 🔎 Overview
This project compares the performance between a relational database system (SQLite) and a NoSQL system (Cassandra), using [Netflix catalog data](https://www.kaggle.com/datasets/shivamb/netflix-shows). We evaluated CRUD operations with different data volumes, index configurations, and replica counts to provide a comprehensive performance analysis.

## 🧩 Key features
- Complete performance benchmarking across CRUD operations
- Index performance impact analysis
- Replication testing (1, 2, and 5 replicas in Cassandra)
- Testing with varied data volumes (small samples to 30K records)

## 💡 Main findings
- **CREATE operations**: SQLite significantly outperforms Cassandra
- **READ operations**: 
  - SQLite with index provides the best performance
  - SQLite without an index is slightly faster than Cassandra with an index
  - Cassandra with index performs reasonably well
  - Cassandra without index is substantially slower
- **UPDATE/DELETE operations**:
    - SQLite shows extremely fast performance, especially with indexes
    - Cassandra is much slower for these operations
    - Adding an index in Cassandra reduces execution times by approximately half
- **Replica count**: Surprisingly, varying the number of replicas (1, 2, or 5) showed minimal performance impact in our testing environment
- **Memory usage**: Both systems showed similar memory patterns across operations

## 🛠️ Installation
Instructions are provided in [`install_cassandra_linux.md`](./install_cassandra_linux.md).
> Note that **Python 3.11** is recommended as Python 3.12 introduces compatibility issues with some components.

## ⚙️ Note on execution
The complete benchmark takes approximately **45 minutes to run** due to multiple test iterations, table rebuilding between tests, and comprehensive data volume testing.

## 📝 Documentation
All analysis details, code, and results are available in the [notebook](./notebook.ipynb) (in french), along with [HTML](./notebook.html) and [PDF](./notebook.pdf) exports of the notebook for easier viewing.

## 🎓 Academic context
This project was developed during the second year of the Master’s program in Data Science and Complex Systems at the University of Strasbourg.

The [original project assignment](./resources/project-assignment-fr.pdf) (in french) is also available for reference.

## 👷‍♂️ Contributors
- Zoé MARQUIS
- Charlotte KRUZIC