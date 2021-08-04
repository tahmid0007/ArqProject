#!/bin/bash
echo "Sentence 1: Tesla S3 is such a beautiful car."
curl -X GET localhost:80 -d '{"sentence":"Tesla S3 is such a beautiful car."}'
echo "Sentence 2: This horrible pandemic is ruining lives."
curl -X GET localhost:80 -d '{"sentence":"This horrible pandemic is ruining lives."}'
