resource "dynatrace_request_attribute" "SI" {
  name                         = "SI"
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
        delimiter     = "SI="
        end_delimiter = ";"
        position      = "BETWEEN"
      }
    }
  }
}
