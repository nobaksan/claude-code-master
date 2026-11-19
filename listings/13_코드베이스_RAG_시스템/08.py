def llm_based_chunk(text: str, llm):
    prompt = """
    다음 텍스트를 의미적으로 독립된 청크로 분할한다.
    각 청크는 자체적으로 이해 가능해야 한다.
    청크 사이에 '---CHUNK---'를 삽입한다.
    텍스트:
    {text}
    """
    result = llm.generate(prompt.format(text=text))
    chunks = result.split('---CHUNK---')
    return [c.strip() for c in chunks if c.strip()]
