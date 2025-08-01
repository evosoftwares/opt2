const axios = require("axios").default;
const qs = require("qs");

async function _obterQRCodeCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var id = ffVariables["id"];

  var url = `https://api.asaas.com/v3/payments/${id}/pixQrCode`;
  var headers = {
    accept: `application/json`,
    access_token: `\$aact_prod_000MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6Ojg1OTI0YjdiLTk1ODEtNDc0ZS04N2YzLTY0ZDk2MGM4ZDI3Yjo6JGFhY2hfNDhlN2M3OTAtOGY4NC00ZDE2LTk0NWQtNjAwMTU4ODhkMTM3`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _checaStatusCobrancaCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var id = ffVariables["id"];

  var url = `https://api.asaas.com/v3/payments/${id}/status`;
  var headers = {
    accept: `application/json`,
    access_token: `\$aact_prod_000MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6Ojg1OTI0YjdiLTk1ODEtNDc0ZS04N2YzLTY0ZDk2MGM4ZDI3Yjo6JGFhY2hfNDhlN2M3OTAtOGY4NC00ZDE2LTk0NWQtNjAwMTU4ODhkMTM3`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _criarClienteAsaasCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var name = ffVariables["name"];
  var cpfCnpj = ffVariables["cpfCnpj"];
  var email = ffVariables["email"];
  var phone = ffVariables["phone"];
  var postalCode = ffVariables["postalCode"];

  var url = `https://api.asaas.com/v3/customers`;
  var headers = {
    accept: `application/json`,
    access_token: `\$aact_prod_000MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6Ojg1OTI0YjdiLTk1ODEtNDc0ZS04N2YzLTY0ZDk2MGM4ZDI3Yjo6JGFhY2hfNDhlN2M3OTAtOGY4NC00ZDE2LTk0NWQtNjAwMTU4ODhkMTM3`,
    "content-type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "name": "${escapeStringForJson(name)}",
  "cpfCnpj": "${escapeStringForJson(cpfCnpj)}",
  "email": "${escapeStringForJson(email)}",
  "phone": "${escapeStringForJson(phone)}",
  "postalCode": "${escapeStringForJson(postalCode)}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _criarCobrancaAsaasCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var customer = ffVariables["customer"];
  var billingType = ffVariables["billingType"];
  var value = ffVariables["value"];
  var dueDate = ffVariables["dueDate"];
  var description = ffVariables["description"];
  var holderName = ffVariables["holderName"];
  var number = ffVariables["number"];
  var expiryMonth = ffVariables["expiryMonth"];
  var expiryYear = ffVariables["expiryYear"];
  var ccv = ffVariables["ccv"];
  var name = ffVariables["name"];
  var email = ffVariables["email"];
  var cpfCnpj = ffVariables["cpfCnpj"];
  var postalCode = ffVariables["postalCode"];
  var adressNumber = ffVariables["adressNumber"];
  var phone = ffVariables["phone"];
  var remoteIp = ffVariables["remoteIp"];

  var url = `https://api.asaas.com/v3/lean/payments/`;
  var headers = {
    accept: `application/json`,
    access_token: `\$aact_prod_000MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6Ojg1OTI0YjdiLTk1ODEtNDc0ZS04N2YzLTY0ZDk2MGM4ZDI3Yjo6JGFhY2hfNDhlN2M3OTAtOGY4NC00ZDE2LTk0NWQtNjAwMTU4ODhkMTM3`,
    "content-type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "customer": "${escapeStringForJson(customer)}",
  "billingType": "${escapeStringForJson(billingType)}",
  "value": ${value},
  "dueDate": "${escapeStringForJson(dueDate)}",
  "description": "${escapeStringForJson(description)}",
  "creditCard": {
    "holderName": "${escapeStringForJson(holderName)}",
    "number": "${escapeStringForJson(number)}",
    "expiryMonth": "${escapeStringForJson(expiryMonth)}",
    "expiryYear": "${escapeStringForJson(expiryYear)}",
    "ccv": "${escapeStringForJson(ccv)}"
  },
  "creditCardHolderInfo": {
    "name": "${escapeStringForJson(name)}",
    "email": "${escapeStringForJson(email)}",
    "cpfCnpj": "${escapeStringForJson(cpfCnpj)}",
    "postalCode": "${escapeStringForJson(postalCode)}",
    "addressNumber": "${escapeStringForJson(adressNumber)}",
    "phone": "${escapeStringForJson(phone)}"
  },
  "remoteIp": "${escapeStringForJson(remoteIp)}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _saqueCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var value = ffVariables["value"];
  var operationType = ffVariables["operationType"];
  var pixAddresKey = ffVariables["pixAddresKey"];
  var pixAdressKeyType = ffVariables["pixAdressKeyType"];
  var description = ffVariables["description"];

  var url = `https://api.asaas.com/v3/transfers`;
  var headers = {
    accept: `application/json`,
    access_token: `\$aact_prod_000MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6Ojg1OTI0YjdiLTk1ODEtNDc0ZS04N2YzLTY0ZDk2MGM4ZDI3Yjo6JGFhY2hfNDhlN2M3OTAtOGY4NC00ZDE2LTk0NWQtNjAwMTU4ODhkMTM3`,
    "content-type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "value": ${value},
  "operationType": "${escapeStringForJson(operationType)}",
  "pixAddressKey": "${escapeStringForJson(pixAddresKey)}",
  "pixAddressKeyType": "${escapeStringForJson(pixAdressKeyType)}",
  "description": "${escapeStringForJson(description)}"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    ObterQRCodeCall: _obterQRCodeCall,
    ChecaStatusCobrancaCall: _checaStatusCobrancaCall,
    CriarClienteAsaasCall: _criarClienteAsaasCall,
    CriarCobrancaAsaasCall: _criarCobrancaAsaasCall,
    SaqueCall: _saqueCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, "\\\\")
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, "\\n")
    .replace(/[\t]/g, "\\t");
}

module.exports = { makeApiCall };
