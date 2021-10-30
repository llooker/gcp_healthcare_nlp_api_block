# GCP Healthcare NLP API Looker Block

## About this LookML Block
This LookML Block is built off the [GCP Healthcare NLP API](https://cloud.google.com/healthcare/docs/concepts/nlp). It uses natural language models to extract healthcare information from medical text using JSON requests and responses. This includes medical concepts, such as medications, procedures, medical conditions, and more. Once the results are loaded to BigQuery, utilize this Block to quickly unnest the results and begin to unlock insights from unstructured data sources for patient/provider insights, including patient family history, known allergies, missed coding opportunities, patient cohorting, and more.

This Block provides a LookML data model that unnests the NLP API results, plus includes two key dashboard views with an easily accessible, exploratory interface for hospital administrators, providers, coders, data scientists, and analysts. This is also compatible with the FHIR schema and other structured data sources.

## Block Requirements
This Block requires a BigQuery database connection with the following:
- Service account with the BigQuery Data Editor and BigQuery Job User predefined roles
- PDTs enabled
- The Looker PDT dataset must be located in the US multi-region location to use this block’s example Explores
- Results from the GCP Healthcare NLP API stored in BigQuery in the standard output format, as described in the [nlp.analyzeEntities](https://cloud.google.com/healthcare/docs/reference/rest/v1/projects.locations.services.nlp/analyzeEntities#response-body) method documentation.  Note the results from the GCP Healthcare NLP API should be stored as native BigQuery rows and not as JSON objects.  Please see the Appendix for more details.

## Out-of-the-box Implementation Steps
- If you haven’t already, download / copy code over from the [GitHub repository](https://github.com/llooker/gcp_healthcare_nlp_api_block)
- Load GCP Healthcare NLP Results to its own View, along with any other Views that you wish to JOIN in LookML Explores
- In the LookML `manifest` file, configure `CONNECTION_NAME` by setting the value equal to the name of your BigQuery connection
- Next, configure NLP_RESULTS_SCOPED_TABLE_PATH, by setting the value equal to the BigQuery SQL table name for your View; Use the syntax: `project_name.table_name`
- [Optional] Configure additional Views, such as ENCOUNTER_SCOPED_TABLE_PATH or PATIENT_SCOPED_TABLE_PATH from FHIR, utilizing the syntax: `project_name.table_name`

## Loading of GCP Healthcare NLP Results into BigQuery:
The GCP Healthcare NLP API takes as input unstructured medical text data and returns structured output in the form of a JSON response object which includes extracted medical entities, standardized terms, and corresponding relationships.

Prior to loading the data into BigQuery, a designated results table accessible to the Looker service account should be created which minimally includes the necessary columns for persisting the results of the GCP Healthcare NLP API call.  (Please see the Appendix for the minimally required BigQuery schema for storing the results.) This output can be loaded into BigQuery as part of a real-time process using the [BigQuery Streaming API](https://cloud.google.com/bigquery/docs/samples/bigquery-table-insert-rows) (for example, as a subsequent API chained to the request/response from the GCP Healthcare NLP API) or bulk loaded as a batch of JSON records via the GCP console, [bq command line utility](https://cloud.google.com/bigquery/docs/bq-command-line-tool), or [BigQuery data loading APIs](https://cloud.google.com/bigquery/docs/loading-data-cloud-storage-json).

## Common Patterns & Customization
- As medical text data can come in a variety of unstructured formats (raw text, PDFs, scanned handwritten notes, etc.), it is likely that some initial pre-processing of the medical text would be necessary prior to calling the Healthcare NLP API and surfacing the results in this Looker Block.  For example, if input text is provided in the form of scanned documents or PDFs, then a first pre-processing step would be to call either the GCP [Vision](https://cloud.google.com/vision/docs) or [Document AI](https://cloud.google.com/document-ai/docs) APIs to extract the medical information into a textual format.  Once the medical information is in a raw textual format, additional pre-processing can be used to extract any standardized information that may be part of the medical record which may often come in a semi-structured format: e.g. patient identifiers, intake, discharge, birth dates, etc.
- The Healthcare NLP API can be accessed programmatically using the language agnostic [REST](https://cloud.google.com/healthcare/docs/reference/rest) and [gRPC](https://cloud.google.com/healthcare/docs/reference/rpc) endpoints via the [nlp.analyzeEntities](https://cloud.google.com/healthcare/docs/reference/rest/v1/projects.locations.services.nlp/analyzeEntities) method.  Please reference the example python code in the Appendix for calling and storing the NLP results.
- When storing the extracted medical entities from the raw text, it is common practice to persist the original, raw medical text in a separate field in the same table with the medical entities as well as additional reference information, record identifiers,  and/or foreign keys to join to other related records.  Within this Looker Block, we have included a generic ID field which can be used to store a record identifier for the medical text.
- If importing source medical text into the Healthcare API FHIR store prior to calling the NLP API, two common FHIR resources for storing this information are 1) [Observation](https://www.hl7.org/fhir/observation.html) resources and 2) [DocumentReference](http://hl7.org/fhir/DocumentReference.html) resources.  When using Observation resources, the medical text data can be stored inline directly in the resource as a text element which precludes the need to convert the medical text from an image or document based format (e.g. TIFF, PDF, DocX, etc).  Alternatively, when using DocumentReferences, the resource object can be used to link back to documents stored in external locations, such as Google Cloud Storage. As mentioned above, these DocumentReference resources would first need to be pre-processed to convert the document format into raw text. When using either Observation or DocumentReference resources, it is common practice to persist the resource ID (e.g. Observation ID, DocumentReference ID) and Patient ID (available as part of the resource object) as a way of tying the extracted medical entities and the raw text back to the FHIR resources and related Patient records.
- If you wish to add JOINS for other structured data sources, such as EMR data or data from the FHIR schema, you can do so as long as you have identifiers pre-processed in the NLP Results View. See examples under `nlp_api → fhir → fhir_unnested_explores` and in the `gcp_healthcare_nlp_api_block` model file. If you wish to learn more about the Looker FHIR Block, please contact your Looker Administrator for assistance.
- We highly recommend utilizing the NLP API Results for downstream AI/ML modeling. This can be built directly into the platform using BigQuery ML or through traditional data science, such as Python or R. Check out our BQML Looker Blocks to get started:
  * [Classification & Regression](https://looker.com/platform/blocks/data-tool/bigquery-ml-classification-and-regression)
  * [Time Series](https://looker.com/platform/blocks/data-tool/bigquery-ml-time-series-forecasting)
  * [Segmentation (K-Means Clustering)](https://looker.com/platform/blocks/data-tool/bigquery-ml-clustering-or-segmentation)

## Notes and Other Known Issues
There is not a standard BQ connector for the GCP Healthcare NLP API but it has been recommended as a future feature in the product roadmap.

## Appendix

#### Healthcare NLP Results BigQuery Schema:

```
[
    {
       "fields": [
         {
           "name": "preferredTerm",
           "type": "STRING"
         },
         {
           "mode": "REPEATED",
           "name": "vocabularyCodes",
           "type": "STRING"
         },
         {
           "name": "entityId",
           "type": "STRING"
         }
       ],
       "mode": "REPEATED",
       "name": "entities",
       "type": "RECORD"
     },
     {
       "fields": [
         {
           "name": "confidence",
           "type": "FLOAT"
         },
         {
           "fields": [
             {
               "name": "confidence",
               "type": "FLOAT"
             },
             {
               "name": "value",
               "type": "STRING"
             }
           ],
           "name": "subject",
           "type": "RECORD"
         },
         {
           "fields": [
             {
               "name": "confidence",
               "type": "FLOAT"
             },
             {
               "name": "value",
               "type": "STRING"
             }
           ],
           "name": "certaintyAssessment",
           "type": "RECORD"
         },
         {
           "name": "type",
           "type": "STRING"
         },
         {
           "fields": [
             {
               "name": "entityId",
               "type": "STRING"
             }
           ],
           "mode": "REPEATED",
           "name": "linkedEntities",
           "type": "RECORD"
         },
         {
           "fields": [
             {
               "name": "confidence",
               "type": "FLOAT"
             },
             {
               "name": "value",
               "type": "STRING"
             }
           ],
           "name": "temporalAssessment",
           "type": "RECORD"
         },
         {
           "fields": [
             {
               "name": "beginOffset",
               "type": "INTEGER"
             },
             {
               "name": "content",
               "type": "STRING"
             }
           ],
           "name": "text",
           "type": "RECORD"
         },
         {
           "name": "mentionId",
           "type": "INTEGER"
         }
       ],
       "mode": "REPEATED",
       "name": "entityMentions",
       "type": "RECORD"
     },
     {
       "fields": [
         {
           "name": "objectId",
           "type": "INTEGER"
         },
         {
           "name": "confidence",
           "type": "FLOAT"
         },
         {
           "name": "subjectId",
           "type": "INTEGER"
         }
       ],
       "mode": "REPEATED",
       "name": "relationships",
       "type": "RECORD"
     }
   ]
```

#### Example python code for accessing the Google Cloud Healthcare NLP API and storing the output in BigQuery:

```
import json
import google.auth

from google.auth.transport import requests
from google.oauth2 import service_account

from google.cloud import bigquery
from google.api_core import retry

_BASE_URL = "https://healthcare.googleapis.com/v1beta1/"
_REGION = 'us-central1'
_CREDENTIALS, _PROJECT_ID = google.auth.default()
_JSON_HEADERS = {"Content-Type": "application/fhir+json;charset=utf-8"}

#BQ
_BQ_DATASET = '<YOUR BQ DATASET>'
_BQ_NLP_TABLE = '<YOUR NLP OUTPUT TABLE>'
_BQ = bigquery.Client()

class BigQueryError(Exception):
   '''Exception raised whenever a BigQuery error happened'''

   def __init__(self, errors):
       super().__init__(self._format(errors))
       self.errors = errors

   def _format(self, errors):
       err = []
       for error in errors:
           err.extend(error['errors'])
       return json.dumps(err)

# [START healthcare_get_session]
def get_session():
   """Creates an authorized Requests Session."""
   session = requests.AuthorizedSession(_CREDENTIALS)

   return session
# [END healthcare_get_session]

def call_healthcare_nlp(medical_text):
   """Calls the Google Cloud Healthcare NLP API with a document returning back extracted entities"""

   session = get_session()
   resource_path = '{}projects/{}/locations/{}/services/nlp:analyzeEntities'.format(_BASE_URL,_PROJECT_ID, _REGION)

   response = session.request('POST',resource_path, headers=_JSON_HEADERS,data=medical_text)

   return(response.text)

# Note: In this example, the table for persisting the Healthcare NLP API was extended with
# an additional column to include the original raw text as well as the API extracted entities
def persist_nlp_in_bq(extracted_entities,raw_medical_text):
   """Stores both raw text and extracted entities in BigQuery"""

   row = json.loads(extracted_entities)
   row['rawText']=raw_medical_text

   table = _BQ.dataset(_BQ_DATASET).table(_BQ_NLP_TABLE)
   errors = _BQ.insert_rows_json(table,
                                json_rows=[row],
                                retry=retry.Retry(deadline=30))

   if errors != []:
       raise BigQueryError(errors)
   else:
       print("Successfully inserted NLP response into BigQuery")


# Construct request document from medical text, call API and store in BQ
medical_text = "Insulin regimen human 5 units IV administered."
nlp_request = {
   'documentContent': medical_text
}

nlp_output=call_healthcare_nlp(json.dumps(nlp_request))
persist_nlp_in_bq(nlp_output,medical_text)
```

## Find an error and have suggestions for improvements?
Blocks were designed for continuous improvement through the help of the entire Looker community, and we’d love your input. To log an error or improvement recommendations, simply create a “New Issue” in the corresponding Github repo for this Block. Please be as detailed as possible in your explanation, and we’ll address it as quickly as we can.



Author(s): Luka Fontanilla, Rachel Kamienski, Kalyan Pamarthy, David Szanjngarten, Rob Vogelbacher
