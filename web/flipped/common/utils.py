import urlparse
def parse_video_id_from_link(link):
    url_data = urlparse.urlparse(link)
    query = urlparse.parse_qs(url_data.query)
    return query['v'][0]


