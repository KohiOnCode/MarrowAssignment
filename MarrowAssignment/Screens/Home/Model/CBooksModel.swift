//
//  BooksModel.swift
//  MarrowAssignment
//
//  Created by Kohinoor on 21/06/24.
//

import Foundation

// MARK: - CBooksModel
struct CBooksModel: Codable {
    let numFound, start: Int?
    let numFoundExact: Bool?
    let docs: [Doc]
    let booksModelNumFound: Int?
    let q: String?
    let offset: Int?

    enum CodingKeys: String, CodingKey {
        case numFound, start, numFoundExact, docs
        case booksModelNumFound = "num_found"
        case q, offset
    }
}

// MARK: - Doc
struct Doc: Codable {
    let authorAlternativeName: [String]?
    let authorKey, authorName: [String]
    let contributor: [String]?
    let coverEditionKey: String?
    let coverI: Int?
    let ddc: [String]?
    let ebookAccess: String?
    let ebookCountI, editionCount: Int?
    let editionKey: [String]?
    let firstPublishYear: Int?
    let firstSentence, format: [String]?
    let hasFulltext: Bool?
    let ia, iaCollection: [String]?
    let iaCollectionS: String?
    let isbn: [String]?
    let key: String?
    let language: [String]?
    let lastModifiedI: Int?
    let lcc, lccn: [String]?
    let lendingEditionS, lendingIdentifierS: String?
    let numberOfPagesMedian: Int?
    let oclc: [String]?
    let ospCount: Int?
    let printdisabledS: String?
    let publicScanB: Bool?
    let publishDate: [String]?
    let publishPlace: [String]?
    let publishYear: [Int]?
    let publisher, seed: [String]?
    let title, titleSuggest, titleSort: String?
    let type: TypeEnum
    let idAmazon, idGoodreads, idLibrarything, idOverdrive: [String]?
    let subject, time, iaLoadedID, iaBoxID: [String]?
    let ratingsAverage, ratingsSortable: Double?
    let ratingsCount, ratingsCount1, ratingsCount2, ratingsCount3: Int?
    let ratingsCount4, ratingsCount5: Int?
    let readinglogCount, wantToReadCount, currentlyReadingCount, alreadyReadCount: Int?
    let publisherFacet: [String]?
    let timeFacet, subjectFacet: [String]?
    let version: Double?
    let lccSort: String?
    let authorFacet: [String]?
    let subjectKey: [String]?
    let ddcSort: String?
    let timeKey, person, personKey, personFacet: [String]?

    enum CodingKeys: String, CodingKey {
        case authorAlternativeName = "author_alternative_name"
        case authorKey = "author_key"
        case authorName = "author_name"
        case contributor
        case coverEditionKey = "cover_edition_key"
        case coverI = "cover_i"
        case ddc
        case ebookAccess = "ebook_access"
        case ebookCountI = "ebook_count_i"
        case editionCount = "edition_count"
        case editionKey = "edition_key"
        case firstPublishYear = "first_publish_year"
        case firstSentence = "first_sentence"
        case format
        case hasFulltext = "has_fulltext"
        case ia
        case iaCollection = "ia_collection"
        case iaCollectionS = "ia_collection_s"
        case isbn, key, language
        case lastModifiedI = "last_modified_i"
        case lcc, lccn
        case lendingEditionS = "lending_edition_s"
        case lendingIdentifierS = "lending_identifier_s"
        case numberOfPagesMedian = "number_of_pages_median"
        case oclc
        case ospCount = "osp_count"
        case printdisabledS = "printdisabled_s"
        case publicScanB = "public_scan_b"
        case publishDate = "publish_date"
        case publishPlace = "publish_place"
        case publishYear = "publish_year"
        case publisher, seed, title
        case titleSuggest = "title_suggest"
        case titleSort = "title_sort"
        case type
        case idAmazon = "id_amazon"
        case idGoodreads = "id_goodreads"
        case idLibrarything = "id_librarything"
        case idOverdrive = "id_overdrive"
        case subject, time
        case iaLoadedID = "ia_loaded_id"
        case iaBoxID = "ia_box_id"
        case ratingsAverage = "ratings_average"
        case ratingsSortable = "ratings_sortable"
        case ratingsCount = "ratings_count"
        case ratingsCount1 = "ratings_count_1"
        case ratingsCount2 = "ratings_count_2"
        case ratingsCount3 = "ratings_count_3"
        case ratingsCount4 = "ratings_count_4"
        case ratingsCount5 = "ratings_count_5"
        case readinglogCount = "readinglog_count"
        case wantToReadCount = "want_to_read_count"
        case currentlyReadingCount = "currently_reading_count"
        case alreadyReadCount = "already_read_count"
        case publisherFacet = "publisher_facet"
        case timeFacet = "time_facet"
        case subjectFacet = "subject_facet"
        case version = "_version_"
        case lccSort = "lcc_sort"
        case authorFacet = "author_facet"
        case subjectKey = "subject_key"
        case ddcSort = "ddc_sort"
        case timeKey = "time_key"
        case person
        case personKey = "person_key"
        case personFacet = "person_facet"
    }
}

enum TypeEnum: String, Codable {
    case work = "work"
}
