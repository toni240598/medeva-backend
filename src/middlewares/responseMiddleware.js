function responseMiddleware(req, res, next) {
  const originalJson = res.json.bind(res);

  res.json = (data) => {
    // ❗ JANGAN format response kalau error (status code 400 ke atas)
    if (res.statusCode >= 400) {
      return originalJson(data);
    }
    
    const response = {
      status: 'success',
      message: null,
      data: null,
      timestamp: new Date().toISOString(),
    };

    // Jika string, anggap sebagai pesan
    if (typeof data === 'string') {
      response.message = data;
    }
    // Jika objek ada items & pagination → format pagination
    else if (data && data.items && data.pagination) {
      response.data = data.items;
      response.pagination = data.pagination;
    }
    // Jika array atau object biasa
    else {
      response.data = data;
    }

    return originalJson(response);
  };

  next();
}

module.exports = responseMiddleware;
