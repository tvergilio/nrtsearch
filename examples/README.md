# NrtSearch Basic Demo

This directory contains a basic end-to-end example of using the `nrtsearch_client`.

It demonstrates the following workflow:
1.  Creating a new index.
2.  Registering a schema with `doc_id` and `content` fields.
3.  Starting the index to make it live.
4.  Indexing two sample documents from a CSV file.
5.  Performing a search against the indexed data.

## How to Run

Ensure the `nrtsearch_server` is running in a separate terminal. Then, from the project root directory, execute the following commands in order:

### Quick Start (Automated Script)
For convenience, the run_demo.sh script automates all the manual steps below. It also resets the demo index each time it is run, guaranteeing a clean start.

To run the entire demo with one command:

```bash
./examples/run_demo.sh
```

### Manual Steps

**1. Create Index:**
```bash
./build/install/nrtsearch/bin/nrtsearch_client createIndex --indexName test_library
```

**2. Register Fields:**
```bash
./build/install/nrtsearch/bin/nrtsearch_client registerFields -f examples/fields.json
```

**3. Start Index:**
```bash
./build/install/nrtsearch/bin/nrtsearch_client startIndex -f examples/start.json
```

**4. Add Documents:**
```bash
./build/install/nrtsearch/bin/nrtsearch_client addDocuments -i test_library -f examples/my_docs.csv -t csv
```

**5. Search:**
```bash
./build/install/nrtsearch/bin/nrtsearch_client search -f examples/search.json
```
