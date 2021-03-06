# -*- coding: utf-8 -*-
# PyCharm cannot directly run. Use "jupyter notebook" in the console to run.
from sklearn.feature_extraction.text import TfidfVectorizer, CountVectorizer
import pandas as pd
import jieba

if __name__ == '__main__':
    datafile = 'C:\\Users\\Administrator\\PycharmProjects\\untitled2\\project_originaldata_cleaned.xls'
    df = pd.read_excel(datafile)
    print(df.shape)


    def chinese_word_cut(mytext):
        return " ".join(jieba.cut(mytext))

    df["content_cutted"]=range(0,250)
    for k in range(0,250):
        df["content_cutted"][k]=chinese_word_cut(df[u'����'][k])

    n_features = 1000
    tf_vectorizer = CountVectorizer(strip_accents='unicode',
                                    max_features=n_features,
                                    stop_words='english',
                                    max_df=0.5,
                                    min_df=10)
    tf = tf_vectorizer.fit_transform(df.content_cutted)

    from sklearn.decomposition import LatentDirichletAllocation

    n_topics = 3
    lda = LatentDirichletAllocation(n_topics=n_topics,
                                    max_iter=50,
                                    learning_method='online',
                                    learning_offset=50.,
                                    random_state=0)

    lda.fit(tf)

    def print_top_words(model, feature_names, n_top_words):
        for topic_idx, topic in enumerate(model.components_):
            print("Topic #%d:" % topic_idx)
            print(" ".join([feature_names[i]
                            for i in topic.argsort()[:-n_top_words - 1:-1]]))
        print()

    n_top_words = 20

    tf_feature_names = tf_vectorizer.get_feature_names()
    print_top_words(lda, tf_feature_names, n_top_words)

    import pyLDAvis
    import pyLDAvis.sklearn

    pyLDAvis.enable_notebook()
    #pyLDAvis.enable_notebook()
    pyLDAvis.sklearn.prepare(lda, tf, tf_vectorizer)

    data = pyLDAvis.sklearn.prepare(lda, tf, tf_vectorizer)
    pyLDAvis.show(data)