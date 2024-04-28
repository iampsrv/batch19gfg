import boto3

def lambda_handler(event, context):
    source_language_code = event['source_language_code']
    target_language_code = event['target_language_code']
    text_to_translate = event['text_to_translate']
    translate_client = boto3.client('translate')
    response = translate_client.translate_text(
        Text=text_to_translate,
        SourceLanguageCode=source_language_code,
        TargetLanguageCode=target_language_code
    )
    translated_text = response['TranslatedText']
    return translated_text
