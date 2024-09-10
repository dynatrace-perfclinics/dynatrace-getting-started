resource "dynatrace_request_attribute" "TSN" {
  name                         = "TSN"
  enabled                      = true
  aggregation                  = "FIRST"
  # confidential               = false
  data_type                    = "STRING"
  normalization                = "ORIGINAL"
  # skip_personal_data_masking = false
  data_sources {
    enabled                        = true
    capturing_and_storage_location = "CAPTURE_AND_STORE_ON_SERVER"
    parameter_name                 = "x-dynatrace-test"
    source                         = "REQUEST_HEADER"
    value_processing {
      # split_at = ""
      # trim     = false
      extract_substring {
        delimiter     = "TSN="
        end_delimiter = ";"
        position      = "BETWEEN"
      }
    }
  }
}
