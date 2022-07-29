use aws_lambda_events::encodings::Body;
use aws_lambda_events::event::apigw::{ApiGatewayProxyRequest, ApiGatewayProxyResponse};
use http::header::HeaderMap;
use lambda_runtime::{service_fn, Error, LambdaEvent};
use reqwest::Client;
use serde::{Deserialize, Serialize};

#[tokio::main]
async fn main() -> Result<(), Error> {
    let handler = service_fn(handler);
    lambda_runtime::run(handler).await?;
    Ok(())
}

#[derive(Deserialize, Serialize, Debug)]
struct ApiResponse {
    id: String,
    joke: String,
}

async fn handler(
    event: LambdaEvent<ApiGatewayProxyRequest>,
) -> Result<ApiGatewayProxyResponse, Error> {
    let (_event, _ctx) = event.into_parts();

    let api = Client::new();

    // let api_resp: ApiResponse = api
    //     .get("https://icanhazdadjoke.com/")
    //     .header("Accept", "application/json")
    //     .send()
    //     .await?
    //     .json()
    //     .await?;

    let url = match _event.query_string_parameters.first("url") {
        Some(value) => value,
        _ => "https://icanhazdadjoke.com/",
    };

    let api_resp: ApiResponse = match api
        .get(url)
        .header("Accept", "application/json")
        .send()
        .await
    {
        Ok(resp) => match resp.json::<ApiResponse>().await {
            Ok(resp) => resp,
            Err(e) => return Err(Box::new(e)),
        },
        // Err(e) => return Err(Box::new(e)),
        Err(e) => ApiResponse {
            id: String::from("-1"),
            joke: e.to_string(),
        },
    };

    let resp = ApiGatewayProxyResponse {
        status_code: 200,
        headers: HeaderMap::new(),
        multi_value_headers: HeaderMap::new(),
        body: Some(Body::Text(api_resp.joke)),
        is_base64_encoded: Some(false),
    };

    Ok(resp)
}
