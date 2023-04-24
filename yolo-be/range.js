module.exports = (req, res, next) => {
    res.header("Content-Range", "product 0-24/319");
    
    next()
}